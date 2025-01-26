import asyncio
from fastapi import FastAPI, WebSocket # type: ignore
from pydantic_models.chat_body import ChatBody
from services.llm_service import LLMService
from services.sort_source_service import SortSourceService
from services.search_service import SearchService # type: ignore

app = FastAPI()

search_services = SearchService()
sort_source_services = SortSourceService()
llm_service = LLMService()

#chat websocket
@app.websocket("/ws/chat")
async def websocket_chat_endpoint (websocket : WebSocket): #websocket provides bi-directional communication between client and the server
    await websocket.accept()

    try:
        await asyncio.sleep(0.1) 
        data = await websocket.receive_json()
        query = data.get("query") 

        search_results = search_services.web_search(query)
        
        sorted_results = sort_source_services.sort_sources(query, search_results)
        

        #send the data back to the user
        await asyncio.sleep(0.1) 
        await websocket.send_json({
            "type": "search_result",
            "data": sorted_results,
        })
        
        for chunk in  llm_service.generate_response(query, sorted_results) :
            await asyncio.sleep(0.1) 
            await websocket.send_json({"type":"content", "data": chunk})
    
    except:
        print("Unexpected Error Occured")
    
    finally:
        await websocket.close()


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