from fastapi import FastAPI # type: ignore
from pydantic_models.chat_body import ChatBody
from services.search_service import SearchService # type: ignore

from pydantic_models.chat_body import ChatBody
from services.search_service import SearchService



app = FastAPI()
search_service = SearchService()
# CHAt
#/chat ? query = Who%20is%20lakshay?  --- %20
@app.post("/chat") # post is used to get the data in the search bar from the user / get query from the user, for getting the body we have created the pydantic model 

def chat_endpoint(body: ChatBody):
    # search the web and get appropriate sources
    search_results = search_service.web_search(body.query)
    print(search_results)
    # sort the resource
    # generate the response using LLMs(gemini here) 
    # for all this we will create a separate class and add them to the services section in server

    return body.query