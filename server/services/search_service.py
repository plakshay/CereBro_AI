from config import Settings
from tavily import TavilyClient
import trafilatura

settings = Settings()
tavily_client = TavilyClient(api_key=settings.TAVILY_API_KEY)


class SearchService:
    def web_search(self, query: str): #function that searches the web and return the results
        try:
            results = []
             # approach - break down the complex query to multiple queries in order to make the search appropriate and more efficient
        # usage of services that are designed to do the same task - TAVILY  
            response = tavily_client.search(query, max_results=10)
            search_results = response.get("results", [])# this only gives the result part from the total response from the server

             # TAVILY is used to give the URLs in order to scrape the resources on the websites( TRAFILATURA ) in order to send it to the GEMINI model
            for result in search_results:
                downloaded = trafilatura.fetch_url(result.get("url"))# downloading the main content
                content = trafilatura.extract(downloaded, include_comments=False)

                results.append(
                    {
                        "title": result.get("title", ""),
                        "url": result.get("url", ""),
                        "content": content or "",
                    }
                )

            return results
        except Exception as e:
            print(e)