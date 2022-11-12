# Specify a base image
FROM node:16-alpine as builder

WORKDIR '/app'
# Install some dependencies
# copy everthing in our SIMPLE_WEB_APP to our current container
COPY package.json  .
RUN npm install
## copy all the source code
COPY . .

# Default command
RUN npm run build


FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

