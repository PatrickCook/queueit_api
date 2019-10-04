class CreateJoinTableGroupQueueUser < ActiveRecord::Migration[5.2]
  def change
    create_join_table :group_queues, :users do |t|
      t.index [:group_queue_id, :user_id]
      # t.index [:user_id, :group_queue_id]
    end
  end
end
