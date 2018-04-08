class CreateWineObservation < ActiveRecord::Migration[5.1]
  def change
    create_table :wine_observations do |t|
      t.integer :wine_class
      t.float :alcohol
      t.float :malic_acid
      t.float :ash
      t.float :alcalinity_of_ash
      t.float :magnesium
      t.float :total_phenols
      t.float :flavanoids
      t.float :nonflavanoid_phenols
      t.float :proanthocyanins
      t.float :color_intensity
      t.float :hue
      t.float :OD280_OD315
      t.float :proline
    end
  end
end
