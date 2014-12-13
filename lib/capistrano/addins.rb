require "capistrano/addins/version"

module Capistrano
  module Addins

    def upload_as(user, file, remote_file, options={ mode: 644, group: nil})
      group = options.fetch(:group, user)

      tmp_name = "/tmp/#{SecureRandom.uuid}"
      file = StringIO.new(fetch(:files_path).join(file).read) if file.is_a? String
      upload! file, tmp_name

      unless test "[[ -d #{File.dirname(remote_file)} ]]"
        sudo :mkdir, "-p", File.dirname(remote_file)
        sudo :chown, "-R", "#{user}:#{group}", File.dirname(remote_file)
      end

      sudo :mv, tmp_name, remote_file
      sudo :chown, "#{user}:#{group}", remote_file
      sudo :chmod, options.fetch(:mode, 644), remote_file

    end

  end
end


include Capistrano::Addins
