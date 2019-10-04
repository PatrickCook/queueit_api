class CorrectQueueMembersSpelling < ActiveRecord::Migration[5.2]
  def change
    rename_column :group_queues, :max_memebers, :max_members
  end
end
