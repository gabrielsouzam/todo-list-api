Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "https://todo-list-five-green-98.vercel.app/" # Front-end URL
    resource "*",
      headers: :any,
      methods: [ :get, :post, :patch, :put, :delete, :options, :head ],
      credentials: true
  end
end
