require 'fileutils'
require 'open-uri'
require 'digest/sha2'
require 'csv'

DATA_URI = 'https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data'
DATA_PATH = Rails.root.join('tmp/wine.data')
DATA_DIGEST = '6be6b1203f3d51df0b553a70e57b8a723cd405683958204f96d23d7cd6aea659'

if DATA_PATH.file?
  digest = Digest::SHA256.hexdigest(DATA_PATH.read)
  unless digest == DATA_DIGEST
    DATA_PATH.rm_f
  end
end
unless DATA_PATH.file?
  URI.parse(DATA_URI).open {|io| IO.copy_stream(io, DATA_PATH.to_s) }
end

column_names = WineObservation.column_names - ['id']
CSV.foreach(DATA_PATH, headers: column_names) do |row|
  WineObservation.find_or_create_by(row.to_h)
end

p WineObservation.count
