RSpec.describe Scam, type: :model do
    
    describe '.all_categories' do
        it 'returns all categories' do
          expect(Scam.all_categories).to eq(['email', 'phone', 'social media'])
        end
      end

    describe '.with_categories' do
      let!(:email_scam) { Scam.create!( title: 'email scam', description: 'description', category: 'email') }
      let!(:phone_scam) { Scam.create!( title: 'phone scam', description: 'description', category: 'phone') }
  
      context 'when categories are provided' do
        it 'returns scams with those categories' do
          expect(Scam.with_categories(['email'])).to include(email_scam)
          expect(Scam.with_categories(['email'])).not_to include(phone_scam)
        end
      end

      context 'when categories are not provided' do
        it 'returns all scams' do
          expect(Scam.with_categories(nil)).to include(email_scam)
          expect(Scam.with_categories(nil)).to include(phone_scam)
        end
      end
    end
end
