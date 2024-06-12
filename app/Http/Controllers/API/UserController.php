<?php

namespace App\Http\Controllers\API;

use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Laravel\Fortify\Rules\Password;
use Illuminate\Validation\ValidationException;

class UserController extends Controller
{
    public function register(Request $request)
    {
        try {
            // Validasi data yang diterima dari request
            $validatedData = $request->validate([
                'name' => ['required', 'string', 'max:255'],
                'username' => ['required', 'string', 'max:255', 'unique:users'],
                'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
                'phone' => ['required', 'string', 'max:255'],
                'password' => ['required', 'string', 'min:8',new Password],
            ]);

            // Buat pengguna baru
            $user = User::create([
                'name' => $validatedData['name'],
                'username' => $validatedData['username'],
                'email' => $validatedData['email'],
                'phone' => $validatedData['phone'],
                'password' => Hash::make($request->password),
            ]);

            // Buat token untuk pengguna baru
            $tokenResult = $user->createToken('authToken')->plainTextToken;

            // Kirim respons sukses
            return ResponseFormatter::success([
                'access_token' => $tokenResult,
                'token_type' => 'Bearer',
                'user' => $user
            ], 'User registered successfully');
        } catch (ValidationException $e) {
            // Tangkap pengecualian validasi
            return ResponseFormatter::error([
                'message' => 'Validation error',
                'errors' => $e->errors(),
            ], 'Validation Error', 422);
        } catch (\Exception $e) {
            // Tangkap pengecualian lainnya
            return ResponseFormatter::error([
                'message' => 'Server error',
                'error' => $e->getMessage(),
            ], 'Server Error', 500);
        }
    }

    public function login(Request $request)
    {
        try {
            $request->validate([
                'email' => 'email|required',
                'password' => 'required'
            ]);

            $credentials = request(['email','password']);
            if(!Auth::attempt($credentials)) {
                return ResponseFormatter::error([
                    'message' => 'Unauthorized'
                ], 'Authentication Failed', 500);
            }

            $user = User::where('email',$request->email)->first();

            if (!Hash::check($request->password, $user->password, [])) {
                throw new \Exception('Invalid Credentials');
            }

            $tokenResult = $user->createToken('authToken')->plainTextToken;
            return ResponseFormatter::success([
                'access_token' => $tokenResult,
                'token_type' => 'Bearer',
                'user' => $user
            ], 'Authenticatiod');

        } catch (\Throwable $th) {
            //throw $th;
        }
    }

    public function fetch(Request $request) 
    {
        return ResponseFormatter::success($request->user(), 'Data profile user sudah berhasil');
    }

    public function updateProfile(Request $request) 
    {
        $data = $request->all();

        $user = Auth::user();
        $user->update($data);

        return ResponseFormatter::success($user, 'Profile Update');
    }

    public function logout(Request $request) 
    {
        $token  =$request->user()->currentAccessToken()->delete();

        return ResponseFormatter::success($token, 'token remoke');
    }
}


