class CreateAlarmTasks < ActiveRecord::Migration
  def change
    create_table :alarm_tasks do |t|
      t.string :title
      t.boolean :finished

      t.timestamps
    end
  end
end
