# src -> 소스 루트
# pip install fastapi
# pip install uvicorn
# pip install jinja2
# pip install python-multipart (post사용)

from fastapi import FastAPI
from fastapi import Request # 특정 요청경로에서 template으로 갈 핸들러 함수 매개변수
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
from starlette.responses import RedirectResponse # redirect
from pydantic import BaseModel # 자동 타입 체크
from models import ToDoRequest
from fastapi import Form # create(POST방식) 때 사용
from fastapi import HTTPException
import os

app = FastAPI()
BASE_DIR = os.path.dirname(os.path.abspath(__file__)) # 현 폴더의 절대경로
app.mount('/static', StaticFiles(directory=os.path.join(BASE_DIR, '../STATIC')), name='static')
templates = Jinja2Templates(directory=os.path.join(BASE_DIR, '../templates'))

@app.get('/')
async def health_check_handler():
    return {'status':'ok'}

todo_data = {
    1:{
        'id':1,
        'contents':'딥러닝 공부',
        'is_done':True,
    },
    2:{
       'id':2,
        'contents':'FastAPI 공부',
        'is_done':False
    },
    3:{
        'id':3,
        'contents':'머신러닝 공부',
        'is_done':False
    },
    4:{
        'id':4,
        'contents':'Django 공부',
        'is_done':False
    }
}
# /todos(할일 1부터 출력) 또는 /todos?order=desc(할일 역순으로 출력)
@app.get('/todos')
async def get_todos_handler(order:str | None=None):
    todos = list(todo_data.values()) # 딕셔너리를 리스트로 변환
    if order and order.upper()=='DESC':
        todos = todos[::-1]
    return todos
