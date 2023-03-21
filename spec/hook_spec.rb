require 'ostruct'

RSpec.describe F1SalesCustom::Hooks::Lead do
  describe '.switch_source' do
    let(:lead) do
      lead = OpenStruct.new
      lead.source = source
      lead.product = product

      lead
    end

    let(:source) do
      source = OpenStruct.new
      source.name = 'Webmotors'

      source
    end

    let(:product) do
      product = OpenStruct.new
      product.name = ''

      product
    end

    let(:switch_source) { described_class.switch_source(lead) }

    context 'Store information in license plate' do
      let(:source_name) { source.name }

      context 'when product name does not have the information' do
        it 'return source' do
          expect(switch_source).to eq(source_name)
        end
      end

      context 'when product is from Santos' do
        context 'when license plate contain LST' do
          before { product.name = 'Fiat Toro LST7C47' }
          
          it 'return Source - LST' do
            expect(switch_source).to eq("#{source_name} - LST")
          end
        end

        context 'when license plate contain LTS' do
          before { product.name = 'Fiat Toro LTS7C47' }
          
          it 'return Source - LTS' do
            expect(switch_source).to eq("#{source_name} - LTS")
          end
        end        
      end

      context 'when product is from Praia Grande' do
        context 'when license plate contain LPG' do
          before { product.name = 'Fiat Toro LPG7C47' }
          
          it 'return Source - LPG' do
            expect(switch_source).to eq("#{source_name} - LPG")
          end
        end

        context 'when license plate contain LPP' do
          before { product.name = 'Fiat Toro LPP7C47' }
          
          it 'return Source - LPP' do
            expect(switch_source).to eq("#{source_name} - LPP")
          end
        end        
      end
    end
  end
end
