class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.string :start_date
      t.string :end_date
      t.string :twitter
      t.string :video_link

      t.timestamps
    end
  end
end
