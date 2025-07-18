FROM python:3.11-slim

# Ustawienie katalogu roboczego
WORKDIR /app

# Skopiowanie zależności i ich instalacja
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Skopiowanie kodu aplikacji
COPY . .

# Domyślne polecenie do uruchomienia aplikacji (jeśli uruchamiasz app.py)
CMD ["python", "app.py"]
