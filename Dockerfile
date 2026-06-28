# imagem base com Python 3.8
FROM python:3.8-slim

# define a pasta de trabalho dentro do container
WORKDIR /app

# copia o arquivo de dependências
COPY requirements.txt .

# instala as dependências
RUN pip install --no-cache-dir -r requirements.txt

# copia todo o projeto para dentro do container
COPY . .

# expõe a porta do Jupyter
EXPOSE 8888

# comando para iniciar o Jupyter ao rodar o container
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
