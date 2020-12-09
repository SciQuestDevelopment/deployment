FROM python:3.7
ADD ./server.tar /server
COPY .env /server/
WORKDIR /server/
RUN pip install --upgrade pip -i https://pypi.tuna.tsinghua.edu.cn/simple && pip install -r requirement.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
CMD ["gunicorn", "-w", "5", "-b", "0.0.0.0:5000", "app:app"]
