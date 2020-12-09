FROM python:3.7
RUN git clone https://github.com/SciQuestDevelopment/Server.git /server
COPY .env /server/
WORKDIR /server/
RUN git checkout development \
    && pip install --upgrade pip -i https://pypi.tuna.tsinghua.edu.cn/simple \
    && pip install -r requirement.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
CMD ["gunicorn", "-w", "5", "-b", "0.0.0.0:5000", "app:app"]
