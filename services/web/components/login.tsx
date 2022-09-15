import { useForm } from 'react-hook-form';
import { yupResolver } from '@hookform/resolvers/yup';
import * as yup from 'yup';
import { Supabase } from 'utils/Supabase';

type UserDataType = {
  email: string;
  password: string;
};

const schema = yup
  .object({
    email: yup.string().email(),
    password: yup
      .string()
      .required('Please Enter your password')
      .matches(
        /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/,
        'Must Contain 8 Characters, One Uppercase, One Lowercase, One Number and one special case Character'
      ),
  })
  .required();

const LoginForm = () => {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm<UserDataType>({
    resolver: yupResolver(schema),
  });
  const onUserSubmit = async (formData: UserDataType) => {
    const { user, session, error } = await Supabase.auth.signIn({
      email: formData.email,
      password: formData.password,
    });

    console.log({ user });
    console.log({ session });
    console.log({ error });
  };

  return (
    <>
      <div className="h-screen w-screen">
        <div className="flex h-full items-center justify-center px-4">
          <div>
            <h1 className="mb-4 text-center">Login</h1>
            <form onSubmit={handleSubmit(onUserSubmit)}>
              <input
                {...register('email')}
                type="email"
                placeholder="Email"
                className="input input-bordered mb-2 w-full"
              />
              <input
                {...register('password')}
                type="password"
                placeholder="Password"
                className="input input-bordered mb-2 w-full"
              />
              <button type="submit" className="btn w-full">
                Submit
              </button>
            </form>
          </div>
        </div>
      </div>
    </>
  );
};

export default LoginForm;
