# Product Assembly

Create a product which is composed of other products.

## Installation

Add the following line to your Gemfile

    gem "spree_product_assembly", github: "spree/spree-product-assembly", branch: "2-2-stable"

Run bundle install as well as the extension intall command to copy and run migrations and
append spree_product_assembly to your js manifest file

    bundle install
    rails g spree_product_assembly:install

_master branch is compatible with spree edge and rails 4 only. Please use
2-0-stable for Spree 2.0.x or 1-3-stable branch for Spree 1.3.x compatibility_

_In case you're upgrading from 1-3-stable of this extension you might want to run a
rake task which assigns a line item to your previous inventory units from bundle
products. That is so you have a better view on the current backend UI and avoid
exceptions. No need to run this task if you're not upgrading from product assembly
1-3-stable_

    rake spree_product_assembly:upgrade

# Use

To build a bundle (assembly product) you'd need to first check the "Can be part"
flag on each product you want to be part of the bundle. Then create a product
and add parts to it. By doing that you're making that product an assembly.

The store will treat assemblies a bit different than regular products on checkout.
Spree will create and track inventory units for its parts rather than for the product itself.
That means you essentially have a product composed of other products. From a
customer perspective it's like they are paying a single amount for a collection
of products.


## Using with spree_wombat

If you use this with spree_wombat make sure that you add this extension after
spree_wombat in your `Gemfile`

This extension provides a specific serializer for shipments `assembly_shipment_serializer`, to use this in your Spree storefront make sure
you configure spree_wombat like this:

```ruby
config.payload_builder = {
  "Spree::Shipment" => {:serializer => "Spree::Wombat::AssemblyShipmentSerializer", :root => "shipments"}
}


Contributing
------------

Spree is an open source project and we encourage contributions. Please see the
[contributors guidelines](http://spreecommerce.com/documentation/contributing_to_spree.html)
before contributing.
