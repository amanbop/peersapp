module Api
  module V1
    # Version V1 for the API
    class MsaController < ApiController
      # returns msa data for a zip in JSON format
      def zips_data
        msa_for_zips = params[:zip_list].split(',')
        zip_to_cbsa_path = "#{Rails.root}/data_dir/zip_to_cbsa.csv"
        cbsa_to_msa_path = "#{Rails.root}/data_dir/cbsa_to_msa.csv"

        peer = PeerProcess.new(zip_to_cbsa_path, cbsa_to_msa_path)
        @peer_data = peer.get_data_for_zips(msa_for_zips) #As array of zipcodes that are strings
        render json: @peer_data
      end
    end
  end
end
