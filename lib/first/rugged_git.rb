require 'rugged'

require 'octokit'

repo = Rugged::Repository.init_at('./data')
File.open('./data/sampled', 'w+'){ |f| f.write 'sample data' }
index = repo.index
index.add('sampled')

credentials = Rugged::Credentials::UserPassword.new(username: 'ennio_torre@hotmail.it', password: 'xenom1985')

#Rugged::Repository.clone_at('https://github.com/EnnioTorre/Learner.git',"some",credentials:credentials)
 # Build the commit
author  = { email: "jason@waldrip.net", name: 'Jason Waldrip', time: Time.now }
options = {
  tree:       index.write_tree(repo),
  author:     author,
  committer:  author,
  message:    'Added',
  parents:    repo.empty? ? [] : [repo.head.target].compact,
  update_ref: 'HEAD'
}

# Commit!
commit=Rugged::Commit.create(repo, options)
puts commit.inspect
#refs=commit[:ref]
#remote = Rugged::Remote.lookup(repo, 'origin') ||
repo.remotes.set_url('origin',"https://github.com/EnnioTorre/trial.git")
#Rugged::Remote.add(repo, 'origin', 'git@github.com:jwaldrip/push-sample.git')

# Push
#credentials = Rugged::Credentials::UserPassword.new({ username: 'ennio_torre@hotmail.it', password: 'xenom1985' })
ref = 'refs/heads/master'
#credentials.call("https://github.com","EnnioTorre","raw")

client = Octokit::Client.new(:login => 'ennio_torre@hotmail.it', :password => 'xenom1985')

#print client.repository?("trial")

if client.repository?("EnnioTorre/trial")
  print 'already created'
else
  client.create_repository("trial")
end

opts={}
opts[:credentials]=credentials
remote=repo.remotes['origin'].push(ref,opts)
puts remote.inspect
#success = remote.check_connection(:fetch,opts)
#raise 'Unable to pull without credentials' unless success

#Rugged::Error: could not push to repo (check for non-bare repo)
