desc "Check if agent forwarding is working"
task :check_forwarding do
  on roles(:all) do |h|
    if test("ssh -T git@github.com")
      info "Agent forwarding is up to #{h}"
    else
      error "Agent forwarding is NOT up to #{h}"
    end
  end
end
