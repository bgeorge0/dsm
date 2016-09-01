/*
* MATLAB Compiler: 6.2 (R2016a)
* Date: Thu Jul 14 15:20:27 2016
* Arguments: "-B" "macro_default" "-W" "dotnet:DSM_Create,DSM_Create,4.0,private" "-T"
* "link:lib" "-d" "C:\Users\bgeorge\Documents\MATLAB\DSMCreate_ESSENTIALS\Library
* Project\DSM_Create\for_testing" "-v"
* "class{DSM_Create:C:\Users\bgeorge\Documents\MATLAB\DSMCreate_ESSENTIALS\arrayNX3.m,C:\U
* sers\bgeorge\Documents\MATLAB\DSMCreate_ESSENTIALS\arrayNX4.m,C:\Users\bgeorge\Documents
* \MATLAB\DSMCreate_ESSENTIALS\FullUnwrap.m,C:\Users\bgeorge\Documents\MATLAB\DSMCreate_ES
* SENTIALS\pointX3.m,C:\Users\bgeorge\Documents\MATLAB\DSMCreate_ESSENTIALS\test_endPOI.m,
* C:\Users\bgeorge\Documents\MATLAB\DSMCreate_ESSENTIALS\test_FullUnwrap.m,C:\Users\bgeorg
* e\Documents\MATLAB\DSMCreate_ESSENTIALS\test_grid_res.m,C:\Users\bgeorge\Documents\MATLA
* B\DSMCreate_ESSENTIALS\test_orientationXYZ.m,C:\Users\bgeorge\Documents\MATLAB\DSMCreate
* _ESSENTIALS\test_startPOI.m,C:\Users\bgeorge\Documents\MATLAB\DSMCreate_ESSENTIALS\test_
* structXYZD.m,C:\Users\bgeorge\Documents\MATLAB\DSMCreate_ESSENTIALS\unwrap_dummy.m}"
* "-a" "C:\Users\bgeorge\Documents\MATLAB\DSMCreate_ESSENTIALS\Resources" 
*/
using System;
using System.Reflection;
using System.IO;
using MathWorks.MATLAB.NET.Arrays;
using MathWorks.MATLAB.NET.Utility;

#if SHARED
[assembly: System.Reflection.AssemblyKeyFile(@"")]
#endif

namespace DSM_CreateNative
{

  /// <summary>
  /// The DSM_Create class provides a CLS compliant, Object (native) interface to the
  /// MATLAB functions contained in the files:
  /// <newpara></newpara>
  /// C:\Users\bgeorge\Documents\MATLAB\DSMCreate_ESSENTIALS\arrayNX3.m
  /// <newpara></newpara>
  /// C:\Users\bgeorge\Documents\MATLAB\DSMCreate_ESSENTIALS\arrayNX4.m
  /// <newpara></newpara>
  /// C:\Users\bgeorge\Documents\MATLAB\DSMCreate_ESSENTIALS\FullUnwrap.m
  /// <newpara></newpara>
  /// C:\Users\bgeorge\Documents\MATLAB\DSMCreate_ESSENTIALS\pointX3.m
  /// <newpara></newpara>
  /// C:\Users\bgeorge\Documents\MATLAB\DSMCreate_ESSENTIALS\test_endPOI.m
  /// <newpara></newpara>
  /// C:\Users\bgeorge\Documents\MATLAB\DSMCreate_ESSENTIALS\test_FullUnwrap.m
  /// <newpara></newpara>
  /// C:\Users\bgeorge\Documents\MATLAB\DSMCreate_ESSENTIALS\test_grid_res.m
  /// <newpara></newpara>
  /// C:\Users\bgeorge\Documents\MATLAB\DSMCreate_ESSENTIALS\test_orientationXYZ.m
  /// <newpara></newpara>
  /// C:\Users\bgeorge\Documents\MATLAB\DSMCreate_ESSENTIALS\test_startPOI.m
  /// <newpara></newpara>
  /// C:\Users\bgeorge\Documents\MATLAB\DSMCreate_ESSENTIALS\test_structXYZD.m
  /// <newpara></newpara>
  /// C:\Users\bgeorge\Documents\MATLAB\DSMCreate_ESSENTIALS\unwrap_dummy.m
  /// </summary>
  /// <remarks>
  /// @Version 4.0
  /// </remarks>
  public class DSM_Create : IDisposable
  {
    #region Constructors

    /// <summary internal= "true">
    /// The static constructor instantiates and initializes the MATLAB Runtime instance.
    /// </summary>
    static DSM_Create()
    {
      if (MWMCR.MCRAppInitialized)
      {
        try
        {
          Assembly assembly= Assembly.GetExecutingAssembly();

          string ctfFilePath= assembly.Location;

          int lastDelimiter= ctfFilePath.LastIndexOf(@"\");

          ctfFilePath= ctfFilePath.Remove(lastDelimiter, (ctfFilePath.Length - lastDelimiter));

          string ctfFileName = "DSM_Create.ctf";

          Stream embeddedCtfStream = null;

          String[] resourceStrings = assembly.GetManifestResourceNames();

          foreach (String name in resourceStrings)
          {
            if (name.Contains(ctfFileName))
            {
              embeddedCtfStream = assembly.GetManifestResourceStream(name);
              break;
            }
          }
          mcr= new MWMCR("",
                         ctfFilePath, embeddedCtfStream, true);
        }
        catch(Exception ex)
        {
          ex_ = new Exception("MWArray assembly failed to be initialized", ex);
        }
      }
      else
      {
        ex_ = new ApplicationException("MWArray assembly could not be initialized");
      }
    }


    /// <summary>
    /// Constructs a new instance of the DSM_Create class.
    /// </summary>
    public DSM_Create()
    {
      if(ex_ != null)
      {
        throw ex_;
      }
    }


    #endregion Constructors

    #region Finalize

    /// <summary internal= "true">
    /// Class destructor called by the CLR garbage collector.
    /// </summary>
    ~DSM_Create()
    {
      Dispose(false);
    }


    /// <summary>
    /// Frees the native resources associated with this object
    /// </summary>
    public void Dispose()
    {
      Dispose(true);

      GC.SuppressFinalize(this);
    }


    /// <summary internal= "true">
    /// Internal dispose function
    /// </summary>
    protected virtual void Dispose(bool disposing)
    {
      if (!disposed)
      {
        disposed= true;

        if (disposing)
        {
          // Free managed resources;
        }

        // Free native resources
      }
    }


    #endregion Finalize

    #region Methods

    /// <summary>
    /// Provides a single output, 0-input Objectinterface to the arrayNX3 MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <returns>An Object containing the first output argument.</returns>
    ///
    public Object arrayNX3()
    {
      return mcr.EvaluateFunction("arrayNX3", new Object[]{});
    }


    /// <summary>
    /// Provides a single output, 1-input Objectinterface to the arrayNX3 MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <param name="datain">Input argument #1</param>
    /// <returns>An Object containing the first output argument.</returns>
    ///
    public Object arrayNX3(Object datain)
    {
      return mcr.EvaluateFunction("arrayNX3", datain);
    }


    /// <summary>
    /// Provides the standard 0-input Object interface to the arrayNX3 MATLAB function.
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public Object[] arrayNX3(int numArgsOut)
    {
      return mcr.EvaluateFunction(numArgsOut, "arrayNX3", new Object[]{});
    }


    /// <summary>
    /// Provides the standard 1-input Object interface to the arrayNX3 MATLAB function.
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="datain">Input argument #1</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public Object[] arrayNX3(int numArgsOut, Object datain)
    {
      return mcr.EvaluateFunction(numArgsOut, "arrayNX3", datain);
    }


    /// <summary>
    /// Provides an interface for the arrayNX3 function in which the input and output
    /// arguments are specified as an array of Objects.
    /// </summary>
    /// <remarks>
    /// This method will allocate and return by reference the output argument
    /// array.<newpara></newpara>
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return</param>
    /// <param name= "argsOut">Array of Object output arguments</param>
    /// <param name= "argsIn">Array of Object input arguments</param>
    /// <param name= "varArgsIn">Array of Object representing variable input
    /// arguments</param>
    ///
    [MATLABSignature("arrayNX3", 1, 1, 0)]
    protected void arrayNX3(int numArgsOut, ref Object[] argsOut, Object[] argsIn, params Object[] varArgsIn)
    {
        mcr.EvaluateFunctionForTypeSafeCall("arrayNX3", numArgsOut, ref argsOut, argsIn, varArgsIn);
    }
    /// <summary>
    /// Provides a single output, 0-input Objectinterface to the arrayNX4 MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <returns>An Object containing the first output argument.</returns>
    ///
    public Object arrayNX4()
    {
      return mcr.EvaluateFunction("arrayNX4", new Object[]{});
    }


    /// <summary>
    /// Provides a single output, 1-input Objectinterface to the arrayNX4 MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <param name="datain">Input argument #1</param>
    /// <returns>An Object containing the first output argument.</returns>
    ///
    public Object arrayNX4(Object datain)
    {
      return mcr.EvaluateFunction("arrayNX4", datain);
    }


    /// <summary>
    /// Provides the standard 0-input Object interface to the arrayNX4 MATLAB function.
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public Object[] arrayNX4(int numArgsOut)
    {
      return mcr.EvaluateFunction(numArgsOut, "arrayNX4", new Object[]{});
    }


    /// <summary>
    /// Provides the standard 1-input Object interface to the arrayNX4 MATLAB function.
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="datain">Input argument #1</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public Object[] arrayNX4(int numArgsOut, Object datain)
    {
      return mcr.EvaluateFunction(numArgsOut, "arrayNX4", datain);
    }


    /// <summary>
    /// Provides an interface for the arrayNX4 function in which the input and output
    /// arguments are specified as an array of Objects.
    /// </summary>
    /// <remarks>
    /// This method will allocate and return by reference the output argument
    /// array.<newpara></newpara>
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return</param>
    /// <param name= "argsOut">Array of Object output arguments</param>
    /// <param name= "argsIn">Array of Object input arguments</param>
    /// <param name= "varArgsIn">Array of Object representing variable input
    /// arguments</param>
    ///
    [MATLABSignature("arrayNX4", 1, 1, 0)]
    protected void arrayNX4(int numArgsOut, ref Object[] argsOut, Object[] argsIn, params Object[] varArgsIn)
    {
        mcr.EvaluateFunctionForTypeSafeCall("arrayNX4", numArgsOut, ref argsOut, argsIn, varArgsIn);
    }
    /// <summary>
    /// Provides a single output, 0-input Objectinterface to the FullUnwrap MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// Round all points to 4 decimal places
    /// </remarks>
    /// <returns>An Object containing the first output argument.</returns>
    ///
    public Object FullUnwrap()
    {
      return mcr.EvaluateFunction("FullUnwrap", new Object[]{});
    }


    /// <summary>
    /// Provides a single output, 1-input Objectinterface to the FullUnwrap MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// Round all points to 4 decimal places
    /// </remarks>
    /// <param name="xyzD">Input argument #1</param>
    /// <returns>An Object containing the first output argument.</returns>
    ///
    public Object FullUnwrap(Object xyzD)
    {
      return mcr.EvaluateFunction("FullUnwrap", xyzD);
    }


    /// <summary>
    /// Provides a single output, 2-input Objectinterface to the FullUnwrap MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// Round all points to 4 decimal places
    /// </remarks>
    /// <param name="xyzD">Input argument #1</param>
    /// <param name="poi1">Input argument #2</param>
    /// <returns>An Object containing the first output argument.</returns>
    ///
    public Object FullUnwrap(Object xyzD, Object poi1)
    {
      return mcr.EvaluateFunction("FullUnwrap", xyzD, poi1);
    }


    /// <summary>
    /// Provides a single output, 3-input Objectinterface to the FullUnwrap MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// Round all points to 4 decimal places
    /// </remarks>
    /// <param name="xyzD">Input argument #1</param>
    /// <param name="poi1">Input argument #2</param>
    /// <param name="poi2">Input argument #3</param>
    /// <returns>An Object containing the first output argument.</returns>
    ///
    public Object FullUnwrap(Object xyzD, Object poi1, Object poi2)
    {
      return mcr.EvaluateFunction("FullUnwrap", xyzD, poi1, poi2);
    }


    /// <summary>
    /// Provides a single output, 4-input Objectinterface to the FullUnwrap MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// Round all points to 4 decimal places
    /// </remarks>
    /// <param name="xyzD">Input argument #1</param>
    /// <param name="poi1">Input argument #2</param>
    /// <param name="poi2">Input argument #3</param>
    /// <param name="xyz_stom">Input argument #4</param>
    /// <returns>An Object containing the first output argument.</returns>
    ///
    public Object FullUnwrap(Object xyzD, Object poi1, Object poi2, Object xyz_stom)
    {
      return mcr.EvaluateFunction("FullUnwrap", xyzD, poi1, poi2, xyz_stom);
    }


    /// <summary>
    /// Provides a single output, 5-input Objectinterface to the FullUnwrap MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// Round all points to 4 decimal places
    /// </remarks>
    /// <param name="xyzD">Input argument #1</param>
    /// <param name="poi1">Input argument #2</param>
    /// <param name="poi2">Input argument #3</param>
    /// <param name="xyz_stom">Input argument #4</param>
    /// <param name="grid_res">Input argument #5</param>
    /// <returns>An Object containing the first output argument.</returns>
    ///
    public Object FullUnwrap(Object xyzD, Object poi1, Object poi2, Object xyz_stom, 
                       Object grid_res)
    {
      return mcr.EvaluateFunction("FullUnwrap", xyzD, poi1, poi2, xyz_stom, grid_res);
    }


    /// <summary>
    /// Provides the standard 0-input Object interface to the FullUnwrap MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// Round all points to 4 decimal places
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public Object[] FullUnwrap(int numArgsOut)
    {
      return mcr.EvaluateFunction(numArgsOut, "FullUnwrap", new Object[]{});
    }


    /// <summary>
    /// Provides the standard 1-input Object interface to the FullUnwrap MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// Round all points to 4 decimal places
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="xyzD">Input argument #1</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public Object[] FullUnwrap(int numArgsOut, Object xyzD)
    {
      return mcr.EvaluateFunction(numArgsOut, "FullUnwrap", xyzD);
    }


    /// <summary>
    /// Provides the standard 2-input Object interface to the FullUnwrap MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// Round all points to 4 decimal places
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="xyzD">Input argument #1</param>
    /// <param name="poi1">Input argument #2</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public Object[] FullUnwrap(int numArgsOut, Object xyzD, Object poi1)
    {
      return mcr.EvaluateFunction(numArgsOut, "FullUnwrap", xyzD, poi1);
    }


    /// <summary>
    /// Provides the standard 3-input Object interface to the FullUnwrap MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// Round all points to 4 decimal places
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="xyzD">Input argument #1</param>
    /// <param name="poi1">Input argument #2</param>
    /// <param name="poi2">Input argument #3</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public Object[] FullUnwrap(int numArgsOut, Object xyzD, Object poi1, Object poi2)
    {
      return mcr.EvaluateFunction(numArgsOut, "FullUnwrap", xyzD, poi1, poi2);
    }


    /// <summary>
    /// Provides the standard 4-input Object interface to the FullUnwrap MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// Round all points to 4 decimal places
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="xyzD">Input argument #1</param>
    /// <param name="poi1">Input argument #2</param>
    /// <param name="poi2">Input argument #3</param>
    /// <param name="xyz_stom">Input argument #4</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public Object[] FullUnwrap(int numArgsOut, Object xyzD, Object poi1, Object poi2, 
                         Object xyz_stom)
    {
      return mcr.EvaluateFunction(numArgsOut, "FullUnwrap", xyzD, poi1, poi2, xyz_stom);
    }


    /// <summary>
    /// Provides the standard 5-input Object interface to the FullUnwrap MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// Round all points to 4 decimal places
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="xyzD">Input argument #1</param>
    /// <param name="poi1">Input argument #2</param>
    /// <param name="poi2">Input argument #3</param>
    /// <param name="xyz_stom">Input argument #4</param>
    /// <param name="grid_res">Input argument #5</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public Object[] FullUnwrap(int numArgsOut, Object xyzD, Object poi1, Object poi2, 
                         Object xyz_stom, Object grid_res)
    {
      return mcr.EvaluateFunction(numArgsOut, "FullUnwrap", xyzD, poi1, poi2, xyz_stom, grid_res);
    }


    /// <summary>
    /// Provides an interface for the FullUnwrap function in which the input and output
    /// arguments are specified as an array of Objects.
    /// </summary>
    /// <remarks>
    /// This method will allocate and return by reference the output argument
    /// array.<newpara></newpara>
    /// M-Documentation:
    /// Round all points to 4 decimal places
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return</param>
    /// <param name= "argsOut">Array of Object output arguments</param>
    /// <param name= "argsIn">Array of Object input arguments</param>
    /// <param name= "varArgsIn">Array of Object representing variable input
    /// arguments</param>
    ///
    [MATLABSignature("FullUnwrap", 5, 1, 0)]
    protected void FullUnwrap(int numArgsOut, ref Object[] argsOut, Object[] argsIn, params Object[] varArgsIn)
    {
        mcr.EvaluateFunctionForTypeSafeCall("FullUnwrap", numArgsOut, ref argsOut, argsIn, varArgsIn);
    }
    /// <summary>
    /// Provides a single output, 0-input Objectinterface to the pointX3 MATLAB function.
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <returns>An Object containing the first output argument.</returns>
    ///
    public Object pointX3()
    {
      return mcr.EvaluateFunction("pointX3", new Object[]{});
    }


    /// <summary>
    /// Provides a single output, 1-input Objectinterface to the pointX3 MATLAB function.
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <param name="datain">Input argument #1</param>
    /// <returns>An Object containing the first output argument.</returns>
    ///
    public Object pointX3(Object datain)
    {
      return mcr.EvaluateFunction("pointX3", datain);
    }


    /// <summary>
    /// Provides the standard 0-input Object interface to the pointX3 MATLAB function.
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public Object[] pointX3(int numArgsOut)
    {
      return mcr.EvaluateFunction(numArgsOut, "pointX3", new Object[]{});
    }


    /// <summary>
    /// Provides the standard 1-input Object interface to the pointX3 MATLAB function.
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="datain">Input argument #1</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public Object[] pointX3(int numArgsOut, Object datain)
    {
      return mcr.EvaluateFunction(numArgsOut, "pointX3", datain);
    }


    /// <summary>
    /// Provides an interface for the pointX3 function in which the input and output
    /// arguments are specified as an array of Objects.
    /// </summary>
    /// <remarks>
    /// This method will allocate and return by reference the output argument
    /// array.<newpara></newpara>
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return</param>
    /// <param name= "argsOut">Array of Object output arguments</param>
    /// <param name= "argsIn">Array of Object input arguments</param>
    /// <param name= "varArgsIn">Array of Object representing variable input
    /// arguments</param>
    ///
    [MATLABSignature("pointX3", 1, 1, 0)]
    protected void pointX3(int numArgsOut, ref Object[] argsOut, Object[] argsIn, params Object[] varArgsIn)
    {
        mcr.EvaluateFunctionForTypeSafeCall("pointX3", numArgsOut, ref argsOut, argsIn, varArgsIn);
    }
    /// <summary>
    /// Provides a single output, 0-input Objectinterface to the test_endPOI MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <returns>An Object containing the first output argument.</returns>
    ///
    public Object test_endPOI()
    {
      return mcr.EvaluateFunction("test_endPOI", new Object[]{});
    }


    /// <summary>
    /// Provides the standard 0-input Object interface to the test_endPOI MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public Object[] test_endPOI(int numArgsOut)
    {
      return mcr.EvaluateFunction(numArgsOut, "test_endPOI", new Object[]{});
    }


    /// <summary>
    /// Provides an interface for the test_endPOI function in which the input and output
    /// arguments are specified as an array of Objects.
    /// </summary>
    /// <remarks>
    /// This method will allocate and return by reference the output argument
    /// array.<newpara></newpara>
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return</param>
    /// <param name= "argsOut">Array of Object output arguments</param>
    /// <param name= "argsIn">Array of Object input arguments</param>
    /// <param name= "varArgsIn">Array of Object representing variable input
    /// arguments</param>
    ///
    [MATLABSignature("test_endPOI", 0, 1, 0)]
    protected void test_endPOI(int numArgsOut, ref Object[] argsOut, Object[] argsIn, params Object[] varArgsIn)
    {
        mcr.EvaluateFunctionForTypeSafeCall("test_endPOI", numArgsOut, ref argsOut, argsIn, varArgsIn);
    }
    /// <summary>
    /// Provides a single output, 0-input Objectinterface to the test_FullUnwrap MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <returns>An Object containing the first output argument.</returns>
    ///
    public Object test_FullUnwrap()
    {
      return mcr.EvaluateFunction("test_FullUnwrap", new Object[]{});
    }


    /// <summary>
    /// Provides the standard 0-input Object interface to the test_FullUnwrap MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public Object[] test_FullUnwrap(int numArgsOut)
    {
      return mcr.EvaluateFunction(numArgsOut, "test_FullUnwrap", new Object[]{});
    }


    /// <summary>
    /// Provides an interface for the test_FullUnwrap function in which the input and
    /// output
    /// arguments are specified as an array of Objects.
    /// </summary>
    /// <remarks>
    /// This method will allocate and return by reference the output argument
    /// array.<newpara></newpara>
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return</param>
    /// <param name= "argsOut">Array of Object output arguments</param>
    /// <param name= "argsIn">Array of Object input arguments</param>
    /// <param name= "varArgsIn">Array of Object representing variable input
    /// arguments</param>
    ///
    [MATLABSignature("test_FullUnwrap", 0, 1, 0)]
    protected void test_FullUnwrap(int numArgsOut, ref Object[] argsOut, Object[] argsIn, params Object[] varArgsIn)
    {
        mcr.EvaluateFunctionForTypeSafeCall("test_FullUnwrap", numArgsOut, ref argsOut, argsIn, varArgsIn);
    }
    /// <summary>
    /// Provides a single output, 0-input Objectinterface to the test_grid_res MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <returns>An Object containing the first output argument.</returns>
    ///
    public Object test_grid_res()
    {
      return mcr.EvaluateFunction("test_grid_res", new Object[]{});
    }


    /// <summary>
    /// Provides the standard 0-input Object interface to the test_grid_res MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public Object[] test_grid_res(int numArgsOut)
    {
      return mcr.EvaluateFunction(numArgsOut, "test_grid_res", new Object[]{});
    }


    /// <summary>
    /// Provides an interface for the test_grid_res function in which the input and
    /// output
    /// arguments are specified as an array of Objects.
    /// </summary>
    /// <remarks>
    /// This method will allocate and return by reference the output argument
    /// array.<newpara></newpara>
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return</param>
    /// <param name= "argsOut">Array of Object output arguments</param>
    /// <param name= "argsIn">Array of Object input arguments</param>
    /// <param name= "varArgsIn">Array of Object representing variable input
    /// arguments</param>
    ///
    [MATLABSignature("test_grid_res", 0, 1, 0)]
    protected void test_grid_res(int numArgsOut, ref Object[] argsOut, Object[] argsIn, params Object[] varArgsIn)
    {
        mcr.EvaluateFunctionForTypeSafeCall("test_grid_res", numArgsOut, ref argsOut, argsIn, varArgsIn);
    }
    /// <summary>
    /// Provides a single output, 0-input Objectinterface to the test_orientationXYZ
    /// MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// Return orientationXYZ
    /// </remarks>
    /// <returns>An Object containing the first output argument.</returns>
    ///
    public Object test_orientationXYZ()
    {
      return mcr.EvaluateFunction("test_orientationXYZ", new Object[]{});
    }


    /// <summary>
    /// Provides the standard 0-input Object interface to the test_orientationXYZ MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// Return orientationXYZ
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public Object[] test_orientationXYZ(int numArgsOut)
    {
      return mcr.EvaluateFunction(numArgsOut, "test_orientationXYZ", new Object[]{});
    }


    /// <summary>
    /// Provides an interface for the test_orientationXYZ function in which the input and
    /// output
    /// arguments are specified as an array of Objects.
    /// </summary>
    /// <remarks>
    /// This method will allocate and return by reference the output argument
    /// array.<newpara></newpara>
    /// M-Documentation:
    /// Return orientationXYZ
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return</param>
    /// <param name= "argsOut">Array of Object output arguments</param>
    /// <param name= "argsIn">Array of Object input arguments</param>
    /// <param name= "varArgsIn">Array of Object representing variable input
    /// arguments</param>
    ///
    [MATLABSignature("test_orientationXYZ", 0, 1, 0)]
    protected void test_orientationXYZ(int numArgsOut, ref Object[] argsOut, Object[] argsIn, params Object[] varArgsIn)
    {
        mcr.EvaluateFunctionForTypeSafeCall("test_orientationXYZ", numArgsOut, ref argsOut, argsIn, varArgsIn);
    }
    /// <summary>
    /// Provides a single output, 0-input Objectinterface to the test_startPOI MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <returns>An Object containing the first output argument.</returns>
    ///
    public Object test_startPOI()
    {
      return mcr.EvaluateFunction("test_startPOI", new Object[]{});
    }


    /// <summary>
    /// Provides the standard 0-input Object interface to the test_startPOI MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public Object[] test_startPOI(int numArgsOut)
    {
      return mcr.EvaluateFunction(numArgsOut, "test_startPOI", new Object[]{});
    }


    /// <summary>
    /// Provides an interface for the test_startPOI function in which the input and
    /// output
    /// arguments are specified as an array of Objects.
    /// </summary>
    /// <remarks>
    /// This method will allocate and return by reference the output argument
    /// array.<newpara></newpara>
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return</param>
    /// <param name= "argsOut">Array of Object output arguments</param>
    /// <param name= "argsIn">Array of Object input arguments</param>
    /// <param name= "varArgsIn">Array of Object representing variable input
    /// arguments</param>
    ///
    [MATLABSignature("test_startPOI", 0, 1, 0)]
    protected void test_startPOI(int numArgsOut, ref Object[] argsOut, Object[] argsIn, params Object[] varArgsIn)
    {
        mcr.EvaluateFunctionForTypeSafeCall("test_startPOI", numArgsOut, ref argsOut, argsIn, varArgsIn);
    }
    /// <summary>
    /// Provides a single output, 0-input Objectinterface to the test_structXYZD MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// Return structXYZD
    /// </remarks>
    /// <returns>An Object containing the first output argument.</returns>
    ///
    public Object test_structXYZD()
    {
      return mcr.EvaluateFunction("test_structXYZD", new Object[]{});
    }


    /// <summary>
    /// Provides the standard 0-input Object interface to the test_structXYZD MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// Return structXYZD
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public Object[] test_structXYZD(int numArgsOut)
    {
      return mcr.EvaluateFunction(numArgsOut, "test_structXYZD", new Object[]{});
    }


    /// <summary>
    /// Provides an interface for the test_structXYZD function in which the input and
    /// output
    /// arguments are specified as an array of Objects.
    /// </summary>
    /// <remarks>
    /// This method will allocate and return by reference the output argument
    /// array.<newpara></newpara>
    /// M-Documentation:
    /// Return structXYZD
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return</param>
    /// <param name= "argsOut">Array of Object output arguments</param>
    /// <param name= "argsIn">Array of Object input arguments</param>
    /// <param name= "varArgsIn">Array of Object representing variable input
    /// arguments</param>
    ///
    [MATLABSignature("test_structXYZD", 0, 1, 0)]
    protected void test_structXYZD(int numArgsOut, ref Object[] argsOut, Object[] argsIn, params Object[] varArgsIn)
    {
        mcr.EvaluateFunctionForTypeSafeCall("test_structXYZD", numArgsOut, ref argsOut, argsIn, varArgsIn);
    }
    /// <summary>
    /// Provides a single output, 0-input Objectinterface to the unwrap_dummy MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <returns>An Object containing the first output argument.</returns>
    ///
    public Object unwrap_dummy()
    {
      return mcr.EvaluateFunction("unwrap_dummy", new Object[]{});
    }


    /// <summary>
    /// Provides a single output, 1-input Objectinterface to the unwrap_dummy MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <param name="xyzD">Input argument #1</param>
    /// <returns>An Object containing the first output argument.</returns>
    ///
    public Object unwrap_dummy(Object xyzD)
    {
      return mcr.EvaluateFunction("unwrap_dummy", xyzD);
    }


    /// <summary>
    /// Provides a single output, 2-input Objectinterface to the unwrap_dummy MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <param name="xyzD">Input argument #1</param>
    /// <param name="xyz">Input argument #2</param>
    /// <returns>An Object containing the first output argument.</returns>
    ///
    public Object unwrap_dummy(Object xyzD, Object xyz)
    {
      return mcr.EvaluateFunction("unwrap_dummy", xyzD, xyz);
    }


    /// <summary>
    /// Provides a single output, 3-input Objectinterface to the unwrap_dummy MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <param name="xyzD">Input argument #1</param>
    /// <param name="xyz">Input argument #2</param>
    /// <param name="startPOI">Input argument #3</param>
    /// <returns>An Object containing the first output argument.</returns>
    ///
    public Object unwrap_dummy(Object xyzD, Object xyz, Object startPOI)
    {
      return mcr.EvaluateFunction("unwrap_dummy", xyzD, xyz, startPOI);
    }


    /// <summary>
    /// Provides a single output, 4-input Objectinterface to the unwrap_dummy MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <param name="xyzD">Input argument #1</param>
    /// <param name="xyz">Input argument #2</param>
    /// <param name="startPOI">Input argument #3</param>
    /// <param name="endPOI">Input argument #4</param>
    /// <returns>An Object containing the first output argument.</returns>
    ///
    public Object unwrap_dummy(Object xyzD, Object xyz, Object startPOI, Object endPOI)
    {
      return mcr.EvaluateFunction("unwrap_dummy", xyzD, xyz, startPOI, endPOI);
    }


    /// <summary>
    /// Provides the standard 0-input Object interface to the unwrap_dummy MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public Object[] unwrap_dummy(int numArgsOut)
    {
      return mcr.EvaluateFunction(numArgsOut, "unwrap_dummy", new Object[]{});
    }


    /// <summary>
    /// Provides the standard 1-input Object interface to the unwrap_dummy MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="xyzD">Input argument #1</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public Object[] unwrap_dummy(int numArgsOut, Object xyzD)
    {
      return mcr.EvaluateFunction(numArgsOut, "unwrap_dummy", xyzD);
    }


    /// <summary>
    /// Provides the standard 2-input Object interface to the unwrap_dummy MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="xyzD">Input argument #1</param>
    /// <param name="xyz">Input argument #2</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public Object[] unwrap_dummy(int numArgsOut, Object xyzD, Object xyz)
    {
      return mcr.EvaluateFunction(numArgsOut, "unwrap_dummy", xyzD, xyz);
    }


    /// <summary>
    /// Provides the standard 3-input Object interface to the unwrap_dummy MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="xyzD">Input argument #1</param>
    /// <param name="xyz">Input argument #2</param>
    /// <param name="startPOI">Input argument #3</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public Object[] unwrap_dummy(int numArgsOut, Object xyzD, Object xyz, Object startPOI)
    {
      return mcr.EvaluateFunction(numArgsOut, "unwrap_dummy", xyzD, xyz, startPOI);
    }


    /// <summary>
    /// Provides the standard 4-input Object interface to the unwrap_dummy MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="xyzD">Input argument #1</param>
    /// <param name="xyz">Input argument #2</param>
    /// <param name="startPOI">Input argument #3</param>
    /// <param name="endPOI">Input argument #4</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public Object[] unwrap_dummy(int numArgsOut, Object xyzD, Object xyz, Object 
                           startPOI, Object endPOI)
    {
      return mcr.EvaluateFunction(numArgsOut, "unwrap_dummy", xyzD, xyz, startPOI, endPOI);
    }


    /// <summary>
    /// Provides an interface for the unwrap_dummy function in which the input and output
    /// arguments are specified as an array of Objects.
    /// </summary>
    /// <remarks>
    /// This method will allocate and return by reference the output argument
    /// array.<newpara></newpara>
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return</param>
    /// <param name= "argsOut">Array of Object output arguments</param>
    /// <param name= "argsIn">Array of Object input arguments</param>
    /// <param name= "varArgsIn">Array of Object representing variable input
    /// arguments</param>
    ///
    [MATLABSignature("unwrap_dummy", 4, 1, 0)]
    protected void unwrap_dummy(int numArgsOut, ref Object[] argsOut, Object[] argsIn, params Object[] varArgsIn)
    {
        mcr.EvaluateFunctionForTypeSafeCall("unwrap_dummy", numArgsOut, ref argsOut, argsIn, varArgsIn);
    }

    /// <summary>
    /// This method will cause a MATLAB figure window to behave as a modal dialog box.
    /// The method will not return until all the figure windows associated with this
    /// component have been closed.
    /// </summary>
    /// <remarks>
    /// An application should only call this method when required to keep the
    /// MATLAB figure window from disappearing.  Other techniques, such as calling
    /// Console.ReadLine() from the application should be considered where
    /// possible.</remarks>
    ///
    public void WaitForFiguresToDie()
    {
      mcr.WaitForFiguresToDie();
    }



    #endregion Methods

    #region Class Members

    private static MWMCR mcr= null;

    private static Exception ex_= null;

    private bool disposed= false;

    #endregion Class Members
  }
}
