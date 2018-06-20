require_relative 'peer_process'
zip_to_cbsa_path = 'data_dir/zip_to_cbsa.csv'
cbsa_to_msa_path = 'data_dir/cbsa_to_msa.csv'

peer = PeerProcess.new(zip_to_cbsa_path,cbsa_to_msa_path)
puts peer.get_data_for_zips(['90266','32003','88340','88338']) #As array of zipcodes that are strings
puts peer.get_data_for_zips(90266) #As a single zipcode that is a number
puts peer.get_data_for_zips([90266,32003]) #As array of zipcodes that are numbers
