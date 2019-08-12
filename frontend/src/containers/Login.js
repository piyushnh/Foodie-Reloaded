import React from 'react';
import { Form, Icon, Input, Button, Spin, Layout } from 'antd';
import { connect } from 'react-redux';
import { NavLink } from 'react-router-dom';
import * as actions from '../store/actions/auth/old-action';
import './login.css';

const antIcon = <Icon type="loading" style={{ fontSize: 24 }} spin />;
const { Content} = Layout;


class NormalLoginForm extends React.Component {
  handleSubmit = (e) => {
    e.preventDefault();
    this.props.form.validateFields((err, values) => {
      if (!err) {
        this.props.onAuth(values.email, values.password);
          // this.props.history.push('/');
      }
      else{
        console.log("failed")
      }
    });
  }

  render() {

    let errorMessage = null;
    if (this.props.error) {
        errorMessage = (
            <p>{this.props.error.message}</p>
        );
    }


    const { getFieldDecorator } = this.props.form;
    return (

      <div>
        {errorMessage}
        {
          this.props.loading ?

          <Spin indicator={antIcon} />

          :

      <Content style={{ padding: '20px 100px', }}>
          <Form onSubmit={this.handleSubmit} className="login-form">
            <Form.Item>
              {getFieldDecorator('email', {
                rules: [{
                  type: 'email', message: 'The input is not valid E-mail!',
                },{ required: true, message: 'Please input your email!' }],
              })(
                <Input prefix={<Icon type="mail" style={{ color: 'rgba(0,0,0,.25)' }} />} placeholder="Email" />
              )}
            </Form.Item>
            <Form.Item>
              {getFieldDecorator('password', {
                rules: [{ required: true, message: 'Please input your Password!' }],
              })(
                <Input prefix={<Icon type="lock" style={{ color: 'rgba(0,0,0,.25)' }} />} type="password" placeholder="Password" />
              )}
            </Form.Item>
            <Form.Item>
            <Button type="primary" htmlType="submit" style={{marginRight: '10px'}}>
                Login
            </Button>
            Or
            <NavLink
                style={{marginRight: '10px'}}
                to='/signup/'> signup
            </NavLink>
            </Form.Item>
          </Form>
      </Content>
    }
  </div>
    );
  }
}

const Login = Form.create({ name: 'normal_login' })(NormalLoginForm);


const mapStateToProps = (state) => {
    return {
        loading: state.loading,
        error: state.error
    }
}

const mapDispatchToProps = dispatch => {
    return {
        onAuth: (email, password) => dispatch(actions.authLogin(email, password))
    }
}

export default connect(mapStateToProps, mapDispatchToProps)(Login);
