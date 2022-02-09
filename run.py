# /run.py
import os
from dotenv import load_dotenv, find_dotenv



from src.app import create_app

load_dotenv(find_dotenv())

env_name = os.getenv('FLASK_ENV')
app = create_app(env_name)

import ssl

ctx = ssl.SSLContext(ssl.PROTOCOL_SSLv23)
ctx.load_cert_chain('certificate.pem', 'private.key', password="test")

if __name__ == '__main__':
  port = os.getenv('PORT')
  # run app
  app.run(host='0.0.0.0', port=port, ssl_context=ctx)
  # app.run(host='0.0.0.0', port=port)
