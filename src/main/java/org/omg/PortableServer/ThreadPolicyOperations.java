package org.omg.PortableServer;


/**
* org/omg/PortableServer/ThreadPolicyOperations.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from d:/re/workspace/8-2-build-windows-amd64-cygwin/jdk8u5/2488/corba/src/share/classes/org/omg/PortableServer/poa.idl
* Tuesday, March 18, 2014 1:10:02 AM PDT
*/


/**
	 * The ThreadPolicy specifies the threading model 
	 * used with the created POA. The default is 
	 * ORB_CTRL_MODEL.
	 */
public interface ThreadPolicyOperations  extends org.omg.CORBA.PolicyOperations
{

  /**
	 * specifies the policy value
	 */
  org.omg.PortableServer.ThreadPolicyValue value ();
} // interface ThreadPolicyOperations
