"""
Simple Flask proxy to forward requests to Google Generative Language API.
Run locally and set environment variable `GEMINI_API_KEY` with your server-side API key.

Usage:
  pip install -r requirements.txt
  set GEMINI_API_KEY=AIza...  (Windows) or export GEMINI_API_KEY=AIza... (Linux/mac)
  python api_proxy.py

This exposes POST /api/gemini which accepts the same JSON body the frontend sends and
forwards it to the Generative Language API, returning the JSON response back to the client.
"""
from flask import Flask, request, jsonify
import os
import requests

app = Flask(__name__)

GEMINI_KEY = os.environ.get('GEMINI_API_KEY')
GM_URL = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent'


@app.route('/api/gemini', methods=['POST'])
def proxy_gemini():
    if not GEMINI_KEY:
        return jsonify({'error':{'message':'Server missing GEMINI_API_KEY environment variable.'}}), 500
    try:
        payload = request.get_json(force=True)
    except Exception as e:
        return jsonify({'error':{'message':'Invalid JSON body'}}), 400

    params = {'key': GEMINI_KEY}
    headers = {'Content-Type': 'application/json'}
    resp = requests.post(GM_URL, params=params, headers=headers, json=payload, timeout=30)

    try:
        return jsonify(resp.json()), resp.status_code
    except Exception:
        return (resp.text, resp.status_code, {'Content-Type': 'text/plain'})


if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    print(f"Starting API proxy on http://127.0.0.1:{port} (proxy to Generative Language API)")
    app.run(host='0.0.0.0', port=port)
