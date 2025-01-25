from fastapi import FastAPI # type: ignore
from pydantic_models.chat_body import ChatBody
from services.search_service import SearchService # type: ignore

app = FastAPI()

search_services = SearchService()
#chat
# /chat?query = Who%20is%Lakshay? - this is the way the string will be given to the query, therefore pydantic models are setup
@app.post("/chat")
def search_endpoint(body : ChatBody):
    # steps to achieve the results 
    # 1. search the web and scrape the appropriate resources based on the body.query(user input)
    search_results= search_services.web_search(body.query)
    # 2. sort the sources(according to the least to the most important)
    # 3. generate the response using LLM (gemini)
    print(search_results)
    return body.query