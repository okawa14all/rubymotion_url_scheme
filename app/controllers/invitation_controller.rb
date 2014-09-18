class InvitationController < UIViewController
  attr_accessor :invitation_id

  def viewDidLoad
    super

    rmq.stylesheet = InvitationControllerStylesheet
    init_nav
    rmq(self.view).apply_style :root_view

    puts self.invitation_id

    # Create your views here
  end

  def init_nav
    self.title = 'invitation'
    self.navigationItem.tap do |nav|
      nav.rightBarButtonItem = UIBarButtonItem.alloc.initWithTitle(
        '完了',
        style: UIBarButtonItemStylePlain,
        target: self,
        action: :dismissView
      )
    end
  end

  def dismissView
    self.dismissViewControllerAnimated(true, completion:nil)
  end

end
