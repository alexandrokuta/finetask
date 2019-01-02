class UseridToTasks < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM tasks;'
    add_reference :tasks, :user, null:false, index: true
  end
  def down
    remove_reference :tasks, :user, index: true
  end
end

#migrate実行時とrollback時で処理が異なる時にdef upとdef downで処理を分ける
