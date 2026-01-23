FROM python:3.11

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir streamlit pandas openpyxl plotly pdfplumber

CMD ["python", "-m", "streamlit", "run", "factubam.py", "--server.address=0.0.0.0", "--server.port=8501"]
