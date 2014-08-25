package Noembed::Provider::robertfauver;

use parent 'Noembed::Provider';

sub provider_name { "robertfauver" }
sub patterns { 'http://www\.robertfauver\.com/+?$' }

sub serialize {
  
  my ($self, $body) = @_;
  my $data = $self->{scraper}->scrape($body);

  return {
    title => $data->{alt},
    html  => $self->render($data),
  }

}