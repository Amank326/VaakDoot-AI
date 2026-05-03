import http.server
import socketserver
import webbrowser
import os

PORT = 5500
os.chdir(os.path.dirname(os.path.abspath(__file__)))

class Handler(http.server.SimpleHTTPRequestHandler):
    def log_message(self, format, *args):
        print(f"  → {args[0]} {args[1]}")

print("=" * 50)
print("  🇮🇳  VaakDoot AI — Local Server")
print("=" * 50)
print(f"  ✅  Server running at: http://localhost:{PORT}")
print(f"  📁  Serving: {os.getcwd()}")
print(f"  🛑  Press Ctrl+C to stop")
print("=" * 50)

webbrowser.open(f"http://localhost:{PORT}")

with socketserver.TCPServer(("", PORT), Handler) as httpd:
    httpd.serve_forever()
