require 'package'

class Nodebrew < Package
  description 'Node.js version manager'
  homepage 'https://github.com/hokaccha/nodebrew'
  version 'v0.9.8'
  source_url 'https://github.com/hokaccha/nodebrew/archive/v0.9.8.tar.gz'
  source_sha256 '040c1b32ddce6d83fda76a50ce9bc635ce0040f76a63617d74234449b8ff078b'

  depends_on 'perl'

  def self.install
    system "mkdir -p #{CREW_DEST_PREFIX}/share/nodebrew"
    system "NODEBREW_ROOT=#{CREW_DEST_PREFIX}/share/nodebrew perl nodebrew setup > /dev/null"
    system "mkdir -p #{CREW_DEST_DIR}/$HOME"
    system "mkdir -p #{CREW_DEST_PREFIX}/bin"
    system "ln -s #{CREW_PREFIX}/share/nodebrew/nodebrew #{CREW_DEST_PREFIX}/bin/"
    system "ln -s #{CREW_PREFIX}/share/nodebrew/current/bin/node #{CREW_DEST_PREFIX}/bin/"
    system "ln -s #{CREW_PREFIX}/share/nodebrew/current/bin/npm #{CREW_DEST_PREFIX}/bin/"
    system "ln -s #{CREW_PREFIX}/share/nodebrew/current/bin/npx #{CREW_DEST_PREFIX}/bin/"
    system "ln -s #{CREW_PREFIX}/share/nodebrew #{CREW_DEST_DIR}/$HOME/.nodebrew"
    system "ln -s #{CREW_PREFIX}/share/nodebrew $HOME/.nodebrew"
  end

  def self.postinstall
    puts
    puts "Nodebrew completion support is available for the following shells:".lightblue
    puts "bash fish zsh".lightblue
    puts
    puts "To add nodebrew completion for bash, execute the following:".lightblue
    puts "echo '# nodebrew completion' >> ~/.bashrc".lightblue
    puts "echo 'if [ -f #{CREW_PREFIX}/share/nodebrew/completions/bash/nodebrew-completion ]; then' >> ~/.bashrc".lightblue
    puts "echo '  source #{CREW_PREFIX}/share/nodebrew/completions/bash/nodebrew-completion' >> ~/.bashrc".lightblue
    puts "echo 'fi' >> ~/.bashrc".lightblue
    puts "source ~/.bashrc".lightblue
    puts
    puts "To complete the installation, execute the following:".lightblue
    puts "echo 'export PATH=\$HOME/.nodebrew/current/bin:\$PATH' >> ~/.bashrc && source ~/.bashrc".lightblue
    puts
    puts "To install the latest node, execute:".lightblue
    puts "nodebrew install-binary latest".lightblue
    puts "nodebrew use latest".lightblue
    puts
    puts "To uninstall, execute the following:".lightblue
    puts "crew remove nodebrew".lightblue
    puts "rm -rf #{CREW_PREFIX}/share/nodebrew".lightblue
    puts
  end
end
