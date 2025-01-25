from fastapi import FastAPI # type: ignore
from pydantic_models.chat_body import ChatBody
from services.llm_service import LLMService
from services.sort_source_service import SortSourceService
from services.search_service import SearchService # type: ignore

from pydantic_models.chat_body import ChatBody
from services.search_service import SearchService



app = FastAPI()
search_service = SearchService()
# CHAt
#/chat ? query = Who%20is%20lakshay?  --- %20
@app.post("/chat") # post is used to get the data in the search bar from the user / get query from the user, for getting the body we have created the pydantic model 

search_services = SearchService()
sort_source_services = SortSourceService()
llm_service = LLMService()

#chat
# /chat?query = Who%20is%Lakshay? - this is the way the string will be given to the query, therefore pydantic models are setup
@app.post("/chat")
def search_endpoint(body : ChatBody):
    # steps to achieve the results:

    # 1. search the web and scrape the appropriate resources based on the body.query(user input)
    search_results = search_services.web_search(body.query)

    # 2. sort the sources(according to the least to the most important) - similarity search (cosine similarity)
    sorted_results = sort_source_services.sort_sources(body.query, search_results)
    
    # 3. generate the response using LLM (gemini)
    response = llm_service.generate_response(body.query, sorted_results)
    
    return response


# all these comments are made by me, in order to learn, this project is inspired by RIVAAN RANAWAT not by ChatGpt

