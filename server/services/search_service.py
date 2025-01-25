from config import Settings
from tavily import TavilyClient
import trafilatura

settings = Settings()
tavily_client = TavilyClient(api_key=settings.TAVILY_API_KEY)

class SearchService:
    def web_search(self, query: str):
        # We can use two approaches here:
        # 1. Use the Gemini API to search the complete web - Gemini will create a list of queries from the main query and break down the complex query into simpler ones.
        # 2. Use a service designed for this particular task - Tavily API
        response = tavily_client.search(query, max_results=10)
        search_results = response.get("results", [])

        results = []

        for result in search_results:
            downloaded = trafilatura.fetch_url(result.get("url"))  # Download the main content
            content = trafilatura.extract(downloaded, include_comments=False)

            # Append the result with the correct keys
            results.append({
                "title": result.get("title", ""),  # Use result here, not results
                "url": result.get("url", ""),  # Use result here
                "content": content  # Use the extracted content
            })

        return results  # Return the list of results
