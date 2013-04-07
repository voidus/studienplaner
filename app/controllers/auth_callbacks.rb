Studienplaner.controller do
  post 'auth/:provider/callback' do
    request.env['omniauth.auth'].to_s
  end
end
