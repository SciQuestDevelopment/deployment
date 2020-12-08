FROM python:3.7.0-alpine
COPY ./src ./server
WORKDIR ./server
RUN pip3 install -r requirement.txt -i https://pypi.tuna.tsinghua.edu.cn/simple 
#CMD ["gunicorn", "-w", "5", "-b", "0.0.0.0:5000", "app:app"]
CMD ["sh"]
