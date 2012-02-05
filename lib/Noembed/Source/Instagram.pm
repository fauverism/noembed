package Noembed::Source::Instagram;

use Web::Scraper;

use parent 'Noembed::ImageSource';

sub prepare_source {
  my $self = shift;

  $self->{scraper} = scraper {
    process 'meta[property="og:image"]', src => '@content';
    process 'div.caption', title => 'TEXT';
  };
}

sub patterns { 'https?://instagr\.am/p/.+' }
sub provider_name { "Instagram" }

1;
