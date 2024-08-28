FROM python:3.11

WORKDIR /root/workspace/visual-rag

COPY . /root/workspace/visual-rag

# 安装所需包
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple/ --trusted-host pypi.tuna.tsinghua.edu.cn

#  将/etc/localtime链接到上海时区文件
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 对外暴露的端口号
EXPOSE 9999

CMD ["bash"]

