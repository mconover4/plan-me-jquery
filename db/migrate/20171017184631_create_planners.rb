class CreatePlanners < Users
  def change
    create_table :planners do |t|

      t.timestamps
    end
  end
end
