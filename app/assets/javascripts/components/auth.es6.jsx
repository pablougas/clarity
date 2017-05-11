var Auth = React.createClass({
    handleClick(e) {
        e.preventDefault;
        var email = this.refs.email.value;
        var password = this.refs.password.value;
        $.ajax({
            url: '/login',
            type: 'POST',
            data: {
                email: email,
                password: password
            },
            success: (response) => {
                console.log('it worked!', response);
            }
        });
    },
    propTypes: {
        logo: React.PropTypes.node
    },

  render: function() {
    return (
    <div className="block-center mt-xl wd-xl">
        { /* START panel */ }
        <div className="panel panel-dark panel-flat">
            <div className="panel-heading text-center">
                <a href="#">
                    <img src= {this.props.logo}  alt="Image" className="block-center img-rounded img-responsive" />
                </a>
            </div>
            <div className="panel-body">
                <p className="text-center pv">SIGN IN TO CONTINUE.</p>
                    <div className="form-group has-feedback">
                        <input ref="email" type="email" placeholder="Enter email" autoComplete="off" required="required" className="form-control" />
                        <span className="fa fa-envelope form-control-feedback text-muted"></span>
                    </div>
                    <div className="form-group has-feedback">
                        <input ref="password" type="password" placeholder="Password" required="required" className="form-control" />
                        <span className="fa fa-lock form-control-feedback text-muted"></span>
                    </div>
                    <div className="clearfix">
                        <div className="checkbox c-checkbox pull-left mt0">
                            <label>
                                <input type="checkbox" value="" name="remember" />
                            <em className="fa fa-check"></em>Remember Me</label>
                        </div>
                        <div className="pull-right">
                            <a href="/recover" className="text-muted">Forgot your password?</a>
                        </div>
                    </div>
                    <button className="btn btn-block btn-primary mt-lg" onClick={this.handleClick}>Login</button>
            </div>
        </div>
        { /* END panel */ }
    </div>
    );
  }
});
