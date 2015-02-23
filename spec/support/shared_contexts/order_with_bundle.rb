shared_context "product is ordered as individual and within a bundle" do
  let(:line_items) { create_list(:line_item, 5) }
  let(:order) { create(:order) }
  let(:parts) { create_list(:variant, 3) }

  let(:bundle_variant) { order.line_items.first.variant }
  let(:bundle) { bundle_variant.product }

  let(:common_product) { order.line_items.last.variant }

  before do
    order.line_items = line_items
    expect(bundle_variant).to_not be_nil
    expect(bundle_variant).to_not eql common_product

    bundle.parts = parts + Array(common_product)
  end
end
