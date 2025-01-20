from fastapi import FastAPI
from fastapi import Request # 특정 요청경로에서 template으로 갈 핸들러 함수 매개변수
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
from starlette.responses import RedirectResponse # redirect
from pydantic import BaseModel # 자동 타입 체크

class ToDoRequest(BaseModel):
    id : int
    contents : str
    is_done : bool | None=False