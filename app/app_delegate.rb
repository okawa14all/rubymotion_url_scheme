class AppDelegate
  attr_reader :window

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @main_controller = MainController.new
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(@main_controller)
    @window.makeKeyAndVisible
    true
  end

  def application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    puts url.scheme
    puts controller = url.host
    puts action = url.lastPathComponent
    puts query = url.query

    if url.scheme == 'myapp'
      case controller
      when 'invitation'
        open_invitation_controller(query)
      when 'post'
        open_post_controller(query)
      end
    elsif url.scheme == 'fefefe'
      puts 'open by fefefe'
      true
    else
      false
    end
  end

  def paramsFromQuery(query)
    ary = query.split('&').map do |q|
      q.split('=', 2)
    end
    Hash[ary]
  end

  def open_invitation_controller(query)
    params = paramsFromQuery(query)
    if params['id']
      vc = InvitationController.new
      vc.invitation_id = params['id']
      nav_vc = UINavigationController.alloc.initWithRootViewController(vc)
      @main_controller.presentViewController(nav_vc, animated:true, completion:nil)
    end
  end

  def open_post_controller(query)
    params = paramsFromQuery(query)
    if params['id']
      vc = PostController.new
      vc.post_id = params['id']
      nav_vc = UINavigationController.alloc.initWithRootViewController(vc)
      @main_controller.presentViewController(nav_vc, animated:true, completion:nil)
    end
  end
end
