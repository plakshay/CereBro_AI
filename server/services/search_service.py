from config import Settings
from tavily import TavilyClient
import trafilatura


settings = Settings()
tavily_client = TavilyClient(api_key= settings.TAVILY_API_KEY)

class SearchService:
   def web_search(self, query: str):
    # we can use 2 approaches here:
    # 1. use the gemini api to search the complete web - gemini will create the list of queries from the main query--  it will break the complex queries to a bunch of simple queries
    # 2. usage of service designed for this particular task - tavily api
    response = tavily_client.search(query, max_results=10)
    search_results = response.get("results", [])

    results = []

    for result in search_results:
        downloaded = trafilatura.fetch_url(result.get("url"))  # downloading the main content
        content = trafilatura.extract(downloaded, include_comments=False)

        # Append the result with the correct keys
        results.append({
            "title": result.get("title", ""),  # Use result here, not results
            "url": result.get("url", ""),  # Use result here
            "content": content  # Use the extracted content
        })

    return results  # Make sure to return the list of results

        # to get more data and scrap the website we can use a package called trafilatura