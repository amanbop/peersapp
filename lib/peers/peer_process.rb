require 'json'
require_relative 'peer_data'
# Process the data loaded by PeerData
class PeerProcess
  def initialize(zip_to_cbsa_path, cbsa_to_msa_path)
    # load files into tables
    @zip_to_cbsa_table =  PeerData.csv_table(zip_to_cbsa_path)
    @cbsa_to_msa_table =  PeerData.csv_table(cbsa_to_msa_path)
  end

  def get_data_for_zips(zips)
    final_result = []
    if zips.is_a?(Array)
      zips.each do |zip|
        final_result << get_data(zip)
      end
    elsif zips.is_a?(String) || zips.is_a?(Integer)
      final_result << get_data(zips)
    end
    final_result
  end

  private

  def get_data(zip)
    zip_rows = PeerData.find_rows_with_value(@zip_to_cbsa_table, 'ZIP', zip)
    cbsa_values_from_zip = PeerData.get_values_from_rows(zip_rows, 'CBSA')
    mdiv_rows = PeerData.find_rows_with_value(@cbsa_to_msa_table, 'MDIV', cbsa_values_from_zip)
    cbsa_values = PeerData.get_values_from_rows(mdiv_rows, 'CBSA').uniq
    cbsa_values = cbsa_values_from_zip if cbsa_values.empty?
    cbsa_rows = PeerData.find_rows_with_value(@cbsa_to_msa_table, 'CBSA', cbsa_values)
    lsad_rows = PeerData.find_rows_with_value(cbsa_rows, 'LSAD', 'Metropolitan Statistical Area')
    pop2015_values = PeerData.get_values_from_rows(lsad_rows, 'POPESTIMATE2015').uniq
    pop2014_values = PeerData.get_values_from_rows(lsad_rows, 'POPESTIMATE2014').uniq
    msa_name_values = PeerData.get_values_from_rows(lsad_rows, 'NAME').uniq
    { zip: zip.to_s,
      cbsa: cbsa_values[0] ||= 'N/A',
      msa: msa_name_values[0] ||= 'N/A',
      pop2015: pop2015_values[0] ||= 'N/A',
      pop2014: pop2014_values[0] ||= 'N/A' } #Assumption here is there are no duplicates in data
  end
end
