require 'rails_helper'

describe PeerProcess do
    zip_to_cbsa_path = "data_dir/zip_to_cbsa.csv"
    cbsa_to_msa_path = "data_dir/cbsa_to_msa.csv"
    peer = PeerProcess.new(zip_to_cbsa_path,cbsa_to_msa_path)
    describe 'Given a single zip' do
    zip = "90266"
    result = peer.get_data_for_zips(zip)
        it '1.returns a single element array' do
            expect(result).to be_a(Array)
            expect(result.length).to equal(1)
        end
        it '2.returns a single json record for a single zip' do
            expect(result[0]).to include_json({"zip":"90266","cbsa":"31080","msa":"Los Angeles-Long Beach-Anaheim, CA","pop2015":"13340068","pop2014":"13254397"})
        end
    end
    describe 'Given a list of zips' do
        zips = ["90266",32003,"88340","88338"]
        result = peer.get_data_for_zips(zips)
            it '1.returns a four element array' do
                expect(result).to be_a(Array)
                expect(result.length).to equal(4)
            end
            it '2.returns json strings containg records for a all zips in the list' do
                expect(result[0]).to include_json({"zip":"90266","cbsa":"31080","msa":"Los Angeles-Long Beach-Anaheim, CA","pop2015":"13340068","pop2014":"13254397"})
                expect(result[1]).to include_json({"zip":"32003","cbsa":"27260","msa":"Jacksonville, FL","pop2015":"1449481","pop2014":"1421004"})
                expect(result[2]).to include_json({"zip":"88340","cbsa":"10460","msa":"N/A","pop2015":"N/A","pop2014":"N/A"})
                expect(result[3]).to include_json({"zip":"88338","cbsa":"N/A","msa":"N/A","pop2015":"N/A","pop2014":"N/A"})
            end
        end
    
end
        