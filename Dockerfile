# Our node app is based on `18-alpine` image which is lite-weight linux os
FROM node:18-alpine

# Setting up the environment variables needed to run our nodejs application inside it
ENV DOMAIN="http://localhost:3000" \
PORT=3000 \
STATIC_DIR="./client" \

# Configuring the api keys of Strive (payment gateway) which provides the test api for our usage

PUBLISHABLE_KEY="pk_test_51L5AsSSCC8JVWfvgEtfJkzHMTh7Z5PLY5m1yhR379sJgwAVZEe13NaiG33wsHSyHnPJMjTNOosiPk6AeMI8q0ims0049IKffiu" \
SECRET_KEY="sk_test_51L5AsSSCC8JVWfvgxpyZvQyBRRkHmGBkdyIa94vPD3Zs71qbHGrnSPlrJOIWiR74fbcn1A85yESCFnrrp3aX0Oz900JaunHrhe"

# once, it's launch we will jump inside the given directory
WORKDIR /usr/src/app

# copying our packages inside the container image
COPY package*.json ./

# Running the npm to fetch all the dependencies required to run the nodejs application
RUN npm install

# Copying all the files from local machine to docker container
COPY . .

# Exposing this application at the port no 3000
EXPOSE 3000

# Executing the command to execute the server.js file
CMD ["node", "server.js"]
