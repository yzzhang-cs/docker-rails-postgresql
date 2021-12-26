# Template of Docker-compose for Rails + Postgresql

The template docker-compose repo for Rails and Postgresql. Following the [quickstart guide](https://docs.docker.com/compose/rails/) but modified to organize the directories and be compatible with Rails 6.

## Usage

### Starting a New Project
1. Copy Gemfile and Gemfile.lock to ./app directory.  
    `mkdir -p app; cp Gemfile* ./app`
2. Make the new project.  
    `docker-compose run --no-deps app rails new . --force --database=postgresql`
3. Build the project.  
    `docker-compose build`
4. Link the database(steps below)
    
### Puting an Existing Project in
1. Copy your project(where your Gemfile and Gemfile.lock are) into ./app
2. Build the images  
    `docker-compose build`
3. Link the database(steps below)

### Linking the Database
1. If you don't have one, copy database.yml in this repo to ./app/config  
    `cp database.yml ./app/config`  
    Note: if you have your own database.yml, you may have to modify the services in docker-compose.yml accordingly
2. Create the database
    `docker-compose run app rake db:create`
    
### Running the App for Development
1. After linking the database, do:  
    `docker-compose up`
2. Open your browser and your app is at [http://localhost:3000](http://localhost:3000).

### Production Environment
TODO
