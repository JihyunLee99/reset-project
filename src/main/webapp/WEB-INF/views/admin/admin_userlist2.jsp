<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   	<div id="tmps" data-cnt="${totNum}" list-size="${listSize}"></div>
    <c:forEach items="${result_data }" var="bean">
    			        <div class="row user-row">
			            <div class="col-xs-3 col-sm-2 col-md-1 col-lg-1">
			                <img class="img-circle"
			                     src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=50"
			                     alt="User Pic">
			            </div>
			            <div class="col-xs-8 col-sm-9 col-md-10 col-lg-10">
			                 	<strong>[${bean.manager }]</strong><small>[${bean.email }]</small><br>
			                	<span class="text-muted">소속: ${bean.company }</span>
			            </div>
			            <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1 dropdown-user" data-for=".user${bean.email}">
			                <i class="glyphicon glyphicon-chevron-down text-muted"></i>
			            </div>
			        </div>
			        <div class="row user-infos user${bean.email}">
			            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xs-offset-0 col-sm-offset-0 col-md-offset-1 col-lg-offset-1">
			                <div class="panel panel-primary">
			                    <div class="panel-heading">
			                        <h3 class="panel-title">회원정보</h3>
			                    </div>
			                    <div class="panel-body">
			                        <div class="row">
			                            <div class="col-md-3 col-lg-3 hidden-xs hidden-sm">
			                                <img class="img-circle"
			                                     src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=100"
			                                     alt="User Pic">
			                            </div>
			                            <div class="col-xs-2 col-sm-2 hidden-md hidden-lg">
			                                <img class="img-circle"
			                                     src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=50"
			                                     alt="User Pic">
			                            </div>
			                            <div class="col-xs-10 col-sm-10 hidden-md hidden-lg">
			                 				<strong>[${bean.manager }]</strong><small>[${bean.email }]</small><br>
			                                <dl>
			                                    <dt>User level:</dt><dd>Administrator</dd>
			                                    <dt>Registered since:</dt><dd>11/12/2013</dd>
			                                    <dt>Topics</dt><dd>15</dd>
			                                    <dt>Warnings</dt><dd>0</dd>
			                                </dl>
			                            </div>
			                            <div class=" col-md-9 col-lg-9 hidden-xs hidden-sm">
			                 				<strong>[${bean.manager }]</strong><small>[${bean.email }]</small><br>
			                                <table class="table table-user-information">
			                                    <tbody>
			                                    <tr>
			                                        <td>User level:</td><td>Administrator</td>
			                                    </tr>
			                                    <tr>
			                                        <td>Registered since:</td><td>11/12/2013</td>
			                                    </tr>
			                                    <tr>
			                                        <td>Topics</td><td>15</td>
			                                    </tr>
			                                    <tr>
			                                        <td>Warnings</td><td>0</td>
			                                    </tr>
			                                    </tbody>
			                                </table>
			                            </div>
			                        </div>
			                    </div>
			                    <div class="panel-footer">
			                        <button class="btn btn-sm btn-primary" type="button"
			                                data-toggle="tooltip"
			                                data-original-title="Send message to user"><i class="glyphicon glyphicon-envelope"></i></button>
			                        <span class="pull-right">
			                            <button class="btn btn-sm btn-warning" type="button"
			                                    data-toggle="tooltip"
			                                    data-original-title="Edit this user"><i class="glyphicon glyphicon-edit"></i></button>
			                            <button class="btn btn-sm btn-danger" type="button"
			                                    data-toggle="tooltip"
			                                    data-original-title="Remove this user"><i class="glyphicon glyphicon-remove"></i></button>
			                        </span>
			                    </div>
			                </div>
			            </div>
			        </div>
    </c:forEach>