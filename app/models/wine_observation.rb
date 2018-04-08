class WineObservation < ApplicationRecord
  def self.to_pandas
    df = Pandas.read_sql_table(WineObservation, nil, index_col: :id)
    df['wine_class'] = df['wine_class'].astype(:str)
    df
  end
end
